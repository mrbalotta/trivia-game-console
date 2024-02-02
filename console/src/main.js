import * as providers from './providers'

(function main() {
    for(const provider in providers) {
        const entrypoint = providers[provider]
        if(entrypoint instanceof Function) entrypoint()
    }
})()