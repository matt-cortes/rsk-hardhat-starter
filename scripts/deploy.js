const { deployContract } = require('../util');

async function main() {
  try {
    await deployContract('PruebaPago', "0x855708C0968db3e29ebd7FBa2c2CBdBB29F26401", 2, 98);
    //await deployContract('RskStarter', rskStarterLogs.address);
  } catch (error) {
    console.error(error);
    process.exitCode = 1;
  }
}

main();
