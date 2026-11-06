const major = Number(process.versions.node.split('.')[0]);
if (major !== 18) {
  console.error(`Demo requires Node.js 18.x; current version: ${process.version}. Use the Docker image to run with Node.js 18.`);
  process.exit(1);
}
console.log(`Node.js version OK: ${process.version}`);
