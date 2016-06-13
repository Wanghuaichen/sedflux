if [[ "$TRAVIS_TAG" == v* ]]; then
  export CHANNEL="main"
else
  export CHANNEL="dev"
fi

echo "Uploading to $CHANNEL"
anaconda -t $CSDMS_SEDFLUX_TOKEN upload --force --user csdms --channel $CHANNEL $HOME/miniconda/conda-bld/**/sedflux*bz2

echo "Done."
