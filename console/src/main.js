import * as providers from './providers'
import { User, Address, Permissions } from "./models"
import { toJson } from './decorators'

(function main() {
    /*for(const provider in providers) {
        const entrypoint = providers[provider]
        if(entrypoint instanceof Function) entrypoint()
    }*/

    const userJson = {
        name: "Alessandro",
        qualification: 'expert engineer',
        birthday: '22/11/1988',
        permissions: {
            write: true
        },
        addresses: [{
            street: "Rua Orfanato, 411",
            main: true
        }]
    }

    const user = new User(userJson)

    console.log(
        `${user.name}\n`,
        `${user.qualification ?? "no qualification"}\n`,
        `is addresses[0] type of Address? ${user.addresses[0] instanceof Address}\n`,
        `is addresses[0] main? ${user.addresses[0].isMain()}\n`,
        `is permissions type of Permissions? ${user.permissions instanceof Permissions}\n`,
        `has write permission? ${user.hasWritePermission()}\n`,
        `birthdate year: ${user.birthdate?.getFullYear() ?? "I dont know"}`
    )
    user.addresses[0].street = "aa"

    console.log(toJson(user))
})()