Compact Apache Flume container ( 13.9MB / 7 MB compressed )

## Stack

Build from source of [Flume](https://flume.apache.org/) running on top of lightweight [Alphine Linux](https://alpinelinux.org).

## Example [Netcat -> console] pipeline

```
docker run --rm -it --log-driver none \
       -v $(pwd)/example/flume.conf:/flume/conf/flume.conf \
       -e AGENT=docker \
       -e LOGGER=INFO,console \
       -p 444:44444 \
       jancajthaml/flume:latest
```

run in separate terminal

```
echo foo bar baz | nc localhost 444
```