#/bin/bash
echo "=======================| Preparando local |================================"
echo $0
echo $1
echo $VERSION

mkdir -p nudoku

if [ $1 == install ]; then
  echo "=====================| Baixando Jogo |=================================="  
    if [ $VERSION ];
    then
      wget -qO- https://github.com/jubalh/nudoku/archive/$VERSION.tar.gz | tar xz -C nudoku/ --strip-components=1
    else
      wget -qO- https://github.com/jubalh/nudoku/archive/1.0.0.tar.gz | tar xz -C nudoku/ --strip-components=1
    fi
    echo "====================| Jogo Baixado! |==================================="
  echo "======================| Instalando | ====================================="
  sudo dnf install gettext gettext-devel autoconf automake
  cd nudoku
  autoreconf -i
  ./configure
  make
  cd src/
  sudo cp nudoku /usr/local/bin
  cd ..
  cd man
  sudo cp nudoku.6  /usr/local/share/man/man6
  
  echo "======================|Instalado com sucesso! | ==============================="
  nudoku

elif [ $1 == remove ]; 
then
  echo "======================| Removendo jogo |======================================"
  cd /usr/local/bin
  sudo rm -rf nudoku
  echo "==================|---Jogo removido com sucesso!---|======================"
fi

