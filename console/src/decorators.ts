import 'reflect-metadata'


export interface FieldParams {
    type?: Constructor 
    transform?: (value: string) => any 
    alias?: string
    exclude?: boolean
}

export function Field(param?: FieldParams) {
    return (instance: any, propertyKey: string) => {
        if(param?.exclude) Reflect.defineMetadata('design:excludeProperty', param!!.exclude, instance, propertyKey)
        if(param?.type) Reflect.defineMetadata('design:explicitType', param!!.type, instance, propertyKey)
        if(param?.transform) Reflect.defineMetadata('design:transformType', param!!.transform, instance, propertyKey)
        if(param?.alias) {
            Reflect.defineMetadata('design:dataProperty', propertyKey, instance, param!!.alias)
            Reflect.defineMetadata('design:plainProperty', param!!.alias, instance, propertyKey)
        }
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

        getTransformType(property: Extract<keyof T, string> | string): Fn | undefined {
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


export function toJson(value: any) {
    let plain: Indexable = {}
    for(let key in value) {
        const exclude = Reflect.getMetadata('design:excludeProperty', value, key) ?? false
        if(!exclude) {
            const property = Reflect.getMetadata('design:plainProperty', value, key) ?? key
            plain[property] = value[key]
        }
    }

    return JSON.stringify(plain)
}