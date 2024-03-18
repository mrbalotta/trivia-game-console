 type Constructor<T = any> = { new(...args: any[]): T }

 type Indexable = { [key: string]: any }

 type DeepPartial<T> = {
    [P in keyof T]?: T[P] extends Array<infer U> ? Array<DeepPartial<U>> : DeepPartial<T[P]>
 }