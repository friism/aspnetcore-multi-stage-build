FROM microsoft/aspnetcore-build

WORKDIR app
ADD *.csproj .
RUN dotnet restore

ADD . .
RUN dotnet publish --output /out --configuration Release

FROM microsoft/aspnetcore
WORKDIR /app
COPY --from=0 /out .
ENTRYPOINT dotnet app.dll
