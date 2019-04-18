# farsharing

farsharing is a prototype for subfeatures of a Ridesharing-application to explore collective resource management (and usage).
In its pre-prototypeicality it's restricted in its specific setup (i.e. shared vehicles).

Using Ruby (2.6.1) on Rails (5) as a framework.

An installation (propably not up to date) can be found at [farsharing.econya.de](http://farsharing.econya.de). Use at your own risk; it is not at all meant to be production ready yet.

## Summary

This project is done in order to

  - learn something about the domain of resource management
  - explore some technical issues and ideas
.

It is adjusted towards a scenario where multiple application-users use (and manage/create) real-world resources (cars, in this instantiation).

The interface language is **german**, but fully translatable (using standard rails i18n mechanisms).

A tiny discussion about potential solutions to specific use-cases can be found at [meta-community.org](https://meta-community.org/t/resourcenmanagement-mitfahrgelegenheiten-in-sieben-linden-und-bei-euch/206).

### Design decisions

  - Let server do the work (no 'client-heavy' JavaScript frameworks)
  - to be written ...

## Installation and Setup

```bash
git checkout

bundle
```

```bash
rails db:setup # with demo-data
```

or

```bash
rails db:schema:load # without demo-data
```

### Configuration/Deployment

For production use, you need to set the following environment variables:

  * `DATABASE_URL`: PostgreSQL database connection string.
  * `SMTP_SERVER`: Adress of the SMTP server (i.e. localhost).
  * `SMTP_PORT`: Port of SMTP server.
  * `SMTP_DOMAIN`: 'domain' for SMTP server HELO (i.e. usually NOT localhost).
  * `SMTP_USER`: Credentials for SMTP sending.
  * `SMTP_PWD`: Credentials for SMTP sending.
  * `MAILER_HOST`: Used to generate the links in outgoing mails (application host/url).
  * `SENDER_EMAIL`: email-address from which outgoing mails will be sent.

Can be used with dokku.

## Development

Following gems are bundled and provide helpful output for developers:

```bash
i18n-tasks # shows untranslated keys

annotate # annotates model files

erd # create erd schema (to put in doc, or visit /erd)
```

### Involved mentionable projects

  * [bulma.io](bulma.io) CSS framework
  * [pagy]() Navigation engine
  * [action-policy]() Navigation engine
  * [haml]() templating engine / HTML without closing tags but significant whitespace
  * [material design icons]() Icon Font, never used these once before
  * ...


### Tests

Some tests in `/test` (default task to run `rails t`), rest tbd, as the workflows not yet clear enough.

### Contributions

Are very welcome, **currently we are in search of funding and/or stakeholders**.  Drop me a line or file a github issue.
This should be an open and inclusive space, as e.g. underlined in the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

farsharing is released under the GPLv3 or later (which is also included as file [`LICENSE`](LICENSE) in the source repository of farsharing) and Copyright 2019 Felix Wolfsteller .

