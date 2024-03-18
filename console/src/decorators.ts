import 'reflect-metadata'


export function Field(constructor?: Constructor) {
    return (instance: any, propertyKey: string) => {
        if(constructor) Reflect.defineMetadata('design:explicitType', constructor, instance, propertyKey)
    }
}

type Function = ((value: any) => any)


export function toJson(value: any) {
    let plain: Indexable = {}
    for(let key in value) {
        const property = Reflect.getMetadata('design:plainProperty', value, key) ?? key
        plain[property] = value[key]
    }

    return JSON.stringify(plain)
}

export function Alias(value: string) {
    return (instance: any, propertyKey: string) => {
        Reflect.defineMetadata('design:dataProperty', propertyKey, instance, value)
        Reflect.defineMetadata('design:plainProperty', value, instance, propertyKey)
    }
}

export function Transform(factory: Function) {
    return (instance: any, propertyKey: string) => {
        Reflect.defineMetadata('design:transformType', factory, instance, propertyKey)
    }
}

export function Model<T extends Constructor>(constructor: T) {

    return class extends constructor {
        constructor(...args: any[]) {
            super()
            this.init(args[0])
        }

        init(payload: DeepPartial<T>) {
            for(const key in payload) {
                this.initProperty(key, payload[key])
            }
        }

        getTransformType(property: Extract<keyof T, string> | string): Function | undefined {
            return Reflect.getMetadata('design:transformType', this, property)
        }

        initStructProperty(property: Extract<keyof T, string> | string, value: any, factory?: Constructor) {
            const transformType = this.getTransformType(property)
            const self = this as Indexable
            
            if(transformType) {
                self[property] = transformType(value)
            } else {
                if(factory) self[property] = new factory(value) 
                else self[property] = value 
            }
        }

        initArrayProperty(property: Extract<keyof T, string> | string, value: any, factory?: Constructor) {
            const transformType = this.getTransformType(property)
            const self = this as Indexable
            
            if(transformType) {
                self[property] = value.map((entry: any) => transformType(entry))
            } else {
                if(factory) self[property] = value.map((entry: any) => new factory(entry))
                else self[property] = value 
            }
        }

        initProperty(key: Extract<keyof T, string>, value: any) {
            const property = Reflect.getMetadata('design:dataProperty', this, key) ?? key
            
            if(this.hasOwnProperty(property)) {
                const explicitType: Constructor | undefined = Reflect.getMetadata('design:explicitType', this, property)
                const inferredType: Constructor | undefined = Reflect.getMetadata('design:type', this, property)
                
                if(inferredType === Array) this.initArrayProperty(property, value, explicitType)
                else this.initStructProperty(property, value,  explicitType ?? inferredType)  
            }      
        }
    }
}