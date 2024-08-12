import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const HacklessTokenModule = buildModule("HacklessTokenModule", (m) => {

  const token = m.contract("HacklessToken", []);

  return { token };
});

export default HacklessTokenModule;