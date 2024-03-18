import { Model, Field } from "./decorators"
import { DateTime } from "luxon";


@Model
export class Address {
    public readonly street?: string
    public readonly main?: boolean

    isMain() {
        return this.main ?? false
    }
}

@Model
export class Permissions {
    public readonly read?: boolean
    public readonly write?: boolean
}

@Model
export class User {

    @Field({ exclude: true })
    public readonly qualification?: string

    @Field({ alias: "nickname" })
    public readonly name?: string

    @Field()
    public readonly permissions?: Permissions

    @Field({ type: Address, alias: "addresses" })
    private readonly _addresses?: Address[]

    @Field({ 
        transform: (date: string) => DateTime.fromFormat(date, "dd/MM/yyyy").toJSDate(), 
        alias: "birthday" 
    })
    public readonly birthdate?: Date

    hasWritePermission() {
        return this.permissions?.write ?? false
    }

    get addresses() {
        return this._addresses?.map(value => Object.assign(new Address(), value)) ?? []
    }
}