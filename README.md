# EOSCR Backend Boilerplate

[![N|Solid](https://github.com/eoscostarica/eos-rate/raw/master/docs/eoscostarica-logo-black.png)](https://eoscostarica.io/)

[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com) ![GitHub](https://img.shields.io/github/license/eoscostarica/backend-boilerplate) ![GitHub repo size](https://img.shields.io/github/repo-size/eoscostarica/backend-boilerplate) ![Twitter Follow](https://img.shields.io/twitter/follow/eoscostarica?style=social) ![GitHub forks](https://img.shields.io/github/forks/eoscostarica/backend-boilerplate?style=social)

A highly scalable skeleton with best practices, ideal for backend projects quick start

## Version

- 0.1.0

## Features!

This boilerplate features all the latest tools and practices in the industry

- **[hasura](https://hasura.io)**
  Hasura GraphQL Engine is an opensource service that connects to your databases & microservices and auto-generates a production-ready GraphQL backend

- **[hapi](https://hapi.dev/)**
  A back end service for custom busines logic integrated with hasura using [actions](https://hasura.io/docs/1.0/graphql/manual/actions/index.html#actions)

- **[docker-compose](https://docs.docker.com/compose/)**
  Compose is a tool for defining and running multi-container Docker applications

## File Structure

Within the download you'll find the following directories and files:

```bash
eoscrbackendboilerplate/
├── hasura
│ ├── migrations
│ └── config.ymal
├── hapi
│ ├── src
│ | ├── config
│ | ├── api
│ | ├── routes
│ | └── config.ymal
│ ├── .dockerignore
│ ├── .eslintrc
│ ├── .prettierrc
│ ├── Dockerfile
│ ├── yarn-lock.json
│ └── package.json
├── .env.example
├── .gitignore
├── docker-compose.yaml
├── .LICENSE
├── .prettierrc
├── Dockerfile
├── LICENSE
└── README.md
```

There are some important folders like

- `hapi/src/api` should have all reusable code for example a code to generate tax invoice
- `hapi/src/routes` this folder should only have the endpoint mapping and params validations and use functions from api folder to handle the business logic

## Installation

Basic knowledge about Docker, Docker Compose and NodeJS is required.

### Before to start

Somethings you need before getting started:

- [git](https://git-scm.com/)
- [node.js](https://nodejs.org/es/)
- [Hasura CLI](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/install-hasura-cli.html#install-hasura-cli)

### First time

1.  Clone this repo using `git clone --depth=1 https://github.com/eoscostarica/backend-boilerplate.git <YOUR_PROJECT_NAME>`
2.  Move to the appropriate directory: `cd <YOUR_PROJECT_NAME>`.
3.  Copy the `.env.example` then update the environment variables according to your needs

```
# global
STAGE=dev
APP_NAME=eoscr-backend-boilerplate

# postgres
POSTGRES_USER=eoscr
POSTGRES_PASSWORD=password
POSTGRES_DB=localdb

# hasura
HASURA_GRAPHQL_ENABLE_CONSOLE=true
HASURA_GRAPHQL_ENABLED_LOG_TYPES=startup,query-log,http-log,webhook-log,websocket-log
DATABASE_URL=postgres://eoscr:password@postgres:5432/localdb
HASURA_GRAPHQL_ADMIN_SECRET=myadminsecretkey
HASURA_GRAPHQL_UNAUTHORIZED_ROLE=guest

# hapi
PORT=9090
HOST_ADDRESS=0.0.0.0
EOS_API_ENDPOINT=https://jungle.eosio.cr
EOS_API_PRIVATE_KEY=secrect
HASURA_ADMIN_SECRET=myadminsecretkey
HASURA_URL=http://localhost:8085/v1/graphql
```

### Quick start

At this point you can run `make run`, you can check the services runing on:

- hapi at http://localhost:9090
- hasura at http://localhost:9695
- wallet at http://localhost:8888

## License

MIT © [EOS Costa Rica](https://eoscostarica.io)

## Contributing

Please Read EOS Costa Rica's [Open Source Contributing Guidelines](https://developers.eoscostarica.io/docs/open-source-guidelines).

Please report bugs big and small by [opening an issue](https://github.com/eoscostarica/backend-boilerplate/issues)

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/xavier506">
        <img src="https://avatars0.githubusercontent.com/u/5632966?v=4" width="100px;" alt="Xavier Fernandez"/>
        <br />
        <sub>
          <b>
            Xavier Fernandez
          </b>
        </sub>
      </a>
      <br />
      🤔📝📢🚇
    </td>
    <td align="center">
      <a href="https://github.com/tetogomez">
        <img src="https://avatars3.githubusercontent.com/u/10634375?s=460&v=4" width="100px;" alt="Teto Gomez"/>
        <br />
        <sub>
          <b>
            Teto Gomez
          </b>
        </sub>
      </a>
      <br />
      🤔💻👀
    </td>
    <td align="center">
      <a href="https://github.com/adriexnet">
        <img src="https://avatars3.githubusercontent.com/u/13205620?s=400&u=9adad6d2e42165c184894b9175785d15a903f58b&v=4" width="100px;" alt="Adriel Diaz"/>
        <br />
        <sub>
          <b>
            Rubén Abarca Navarro
          </b>
        </sub>
      </a>
      <br />
      📃💻😎
    </td>
    <td align="center">
      <a href="https://github.com/adriexnet">
        <img src="https://avatars3.githubusercontent.com/u/5375168?s=460&u=542a27a00b761d98851991c6a6d5f78d7b35a2b2&v=4" width="100px;" alt="Adriel Diaz"/>
        <br />
        <sub>
          <b>
            Adriel Diaz
          </b>
        </sub>
      </a>
      <br />
      🏡💻❤️
    </td>
  </tr>
</table>

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!

## About EOS Costa Rica

<p align="center">
	<a href="https://eoscostarica.io">
		<img src="https://github.com/eoscostarica/eos-rate/raw/master/docs/eoscostarica-logo-black.png" width="300">
	</a>
</p>
<br/>

EOS Costa Rica is an independently-owned, self-funded, bare-metal Genesis block producer that provides stable and secure infrastructure for EOSIO blockchains. We support open source software for our community while offering enterprise solutions and custom smart contract development for our clients.

[eoscostarica.io](https://eoscostarica.io) Support OpenSource!
