# ベースイメージとバージョンの選択
ARG VARIANT=20-bullseye
FROM node:${VARIANT}

# 非対話型に切り替える
ENV DEBIAN_FRONTEND=noninteractive

# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"

# 非ルートユーザーを作成
ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 必要なパッケージのインストール
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \
    && apt-get install -y  \
    # curl: URLからデータを転送するためのコマンドラインツール
    curl \
    # file: ファイルの種類を特定するためのユーティリティ
    file \
    # procps: /procファイルシステムを利用してシステム情報を表示する一連のコマンド（ps、topなど）
    procps \
    # vim: 高機能なテキストエディタ
    vim \
    # less: ファイルコンテンツの閲覧に使用するページャープログラム
    less \
    # build-essential: C言語でのプログラミングに必要なコンパイラ（gccなど）、makeツール、その他必要なファイルを含むパッケージ群
    build-essential \
    # locales: システムのロケールを設定するためのパッケージ。文字コードや言語、通貨形式などの設定を含む
    locales \
    # zip: ファイルやディレクトリを圧縮するためのコマンド
    zip \
    # git: ソースのバージョン管理をするツール
    git

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# install tfenv
RUN git clone https://github.com/tfutils/tfenv.git /home/$USERNAME/.tfenv
ENV PATH $PATH:/home/$USERNAME/.tfenv/bin
RUN tfenv install 1.5.0 && tfenv use 1.5.0
RUN chown -R $USERNAME /home/$USERNAME/.tfenv

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm awscliv2.zip

# git ブランチ名をカラー表示するプロンプト表示が遅いのでコメントアウト
RUN sed -i 's/^__bash_prompt$/# __bash_prompt/' ~/.bashrc

# 日本語を使用できるように
ENV LANG=ja_JP.UTF-8

# less for japanese
ENV LESSCHARSET="utf-8"

# git のサジェスト用shellの追加
RUN curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" -o "/home/$USERNAME/.git-completion.bash"
RUN : echo '' | tee -a /home/${USERNAME}/.bashrc && echo '' | tee -a /home/${USERNAME}/.bashrc && echo "source /home/$USERNAME/.git-completion.bash" | tee -a /home/${USERNAME}/.bashrc

# 対話型に切り替える
ENV DEBIAN_FRONTEND=newt
