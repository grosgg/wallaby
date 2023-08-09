# [wallaby](https://wallaby.vieux.click)

Sinatra app generating pdf documents of mathematics exercices with their solutions.

## Installation
- Clone repo
- Install packages: `npm install`
- Setup your AWS credentials with sufficient permissions
- Deploy with serverless: `sls deploy`
- Run locally: `sls rack serve`
- Local console: `bundle exec irb -r ./app.rb`

## Exercice types
- Additions
- Subtractions
- Multiplications
- Divisions
- Problems

## Notes
- Everything is hardcoded in French at the moment
- Difficulty is arbitrary and harcoded

## Objectives
- Add more exercice types
- Add layout options