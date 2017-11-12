# TODO auto detect...?
BASHRC_ROOT_DIR="${HOME}/dotfiles/bashrc"

BASHRC_CORE_DIR="${BASHRC_ROOT_DIR}/core.d"
if [ -d "${BASHRC_CORE_DIR}" ]; then
  for f in "${BASHRC_CORE_DIR}"/*; do source $f; done
else
  echo -e '\e[0;31m'"${BASHRC_CORE_DIR} does not exist!"'\e[0m'
  echo -e '\e[0;31m'"  BASHRC_ROOT_DIR=${BASHRC_ROOT_DIR}"'\e[0m'
fi

if [ ! -z "${LAVOSPRIME_CONTEXT}" ]; then
  LAVOSPRIME_ENVIRONMENT="${LAVOSPRIME_CONTEXT}"
fi

BASHRC_LPCTX_DIR="$BASHRC_ROOT_DIR/${LAVOSPRIME_ENVIRONMENT}.d"
if [ -z "${LAVOSPRIME_ENVIRONMENT}" ]; then
  echo 'LAVOSPRIME_ENVIRONMENT is not set!'
elif [ -d "${BASHRC_LPCTX_DIR}" ]; then
  for f in "${BASHRC_LPCTX_DIR}"/*; do source $f; done
else
  echo -e '\e[0;31m'"${BASHRC_LPCTX_DIR} does not exist!"'\e[0m'
  echo -e '\e[0;31m'"  BASHRC_ROOT_DIR=${BASHRC_ROOT_DIR}"'\e[0m'
  echo -e '\e[0;31m'"  LAVOSPRIME_ENVIRONMENT=${LAVOSPRIME_ENVIRONMENT}"'\e[0m'
fi
