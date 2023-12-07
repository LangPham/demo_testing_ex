#!/bin/sh
# Run mix task to compile and start server

./_build/prod/rel/portfolio_app/bin/portfolio_app eval "Portfolio.Release.migrate"

./_build/prod/rel/portfolio_app/bin/portfolio_app start
