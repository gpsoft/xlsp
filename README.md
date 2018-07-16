# xlsp

Docker, alpine, php7(CLI)を使って、`PhpSpreadsheet`を試す。

# PhpSpreadsheet

- [ガイド](https://phpspreadsheet.readthedocs.io/en/develop/)
- [API](https://phpoffice.github.io/PhpSpreadsheet/master/index.html)

# Docker

alpineベースのphpイメージを使用する。

PhpSpreadsheetに必要なextension:

- gd2
- xml
- zip

`xml`はベースイメージに含まれるっぽい。他の2つは、`Dockerfile`の中で、`docker-php-ext-configure`や`docker-php-ext-install`を使って入れる。

`zip`には`libzip`が必要で、これはphpにバンドルされているが、将来はバンドルされなくなるらしく、extensionのビルド時にwarningが出る。ひとまず放置。ちゃんとやるなら、自力で`libzip`をインストールして、`zip`がそこを参照するようにconfigure(`--with-libzip`)してやればいいらしい。

# Usage

ホストから:

    $ cd xlsp
    $ make image
    $ make dev

Dockerコンテナから:

    ~/proj $ composer install
    ~/proj $ php app.php

コンテナの`~/proj`は、ホストのカレントディレクトリ。コンテナ側で作ったファイルは、`docker`グループに所属する。ホスト側にも`docker`グループが存在する、という想定。

コーディング(編集作業)はホスト側で行う。コンテナ側で実行するのは`php`と`composer`くらい。
