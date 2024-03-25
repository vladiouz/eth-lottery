module.exports = {
  networks: {
    development: {
      host: "172.28.112.1",
      port: 7545,
      network_id: "*",
    },
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200,
    },
  },
};
