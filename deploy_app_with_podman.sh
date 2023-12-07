if git status | grep master; then
  echo "RUNNING: git pull"
  git pull origin master

  echo "Build container"
  podman build -t portfolio_img -f Dockerfile .

  echo "Build stop container"
  podman stop portfolio_con

  echo "Build rm container"
  podman rm portfolio_con

  echo "Build run container"
  podman run -dt -p 44000:4000 -e DATABASE_URL="ecto://postgres:postgres@10.88.0.1:5432/portfolio_prod" -e SECRET_KEY_BASE="k0iulNRHv6okC0iGzpm45niFGkjZwWq26LONDLUkkPU3ln9AW6EdmbzxJLgufJ4U" --name portfolio_con localhost/portfolio_img:latest ./run_app.sh
else
  echo "Not on master branch. Deploy stopped!!!"
fi
