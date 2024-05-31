async function main() {
    // Récupérer le premier compte (déployeur)
    const [deployer] = await ethers.getSigners();

    console.log("Déploiement des contrats avec le compte:", deployer.address);

    // Déploiement du contrat Wallet
    const Wallet = await ethers.getContractFactory("Wallet");
    const wallet = await Wallet.deploy();

    console.log("Contrat Wallet déployé à l'adresse:", wallet.address);
}

// Exécuter la fonction main et gérer les erreurs
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });