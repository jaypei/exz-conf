INSTALL - vim
==

get

.. code-block:: sh

    $ cd /path/to/work
    $ git clone https://github.com/jaypei/exz_conf.git
    $ cd exz_conf
    $ git submodule init
    $ git submodule update

setup

.. code-block:: sh

    $ ln -s /path/to/work/exz_conf/vimconf/_vimrc ~/.vimrc
    $ ln -s /path/to/work/exz_conf/vimconf/_gvimrc ~/.gvimrc
    $ ln -s /path/to/work/exz_conf/vimconf/vimfiles ~/.vim

updating

.. code-block:: sh

    $ cd ~/.vim
    $ git pull --rebase; git submodule update
    $ cd -

