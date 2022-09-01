FROM haskell:9.2.4 as build

RUN cabal update

COPY zephyr/cabal.project .
COPY zephyr/zephyr.cabal .

RUN cabal build --only-dependencies -j4

COPY zephyr/ .
RUN cabal install --installdir=/install --install-method=copy --overwrite-policy=always


FROM debian:stable-slim as runtime

COPY --from=build /install/zephyr /zephyr

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]