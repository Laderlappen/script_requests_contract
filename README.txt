Hardhat + Tenderly setup

1) Install Tenderly:
    - npm install npm install @tenderly/hardhat-tenderly
    - curl https://raw.githubusercontent.com/Tenderly/tenderly-cli/master/scripts/install-linux.sh | sh

2) Add to hardhat.config.js:
    - require("@tenderly/hardhat-tenderly")
    - Add this under module.exports: 
    
	    tenderly: {
		    username: "Username",
		    project: "projectName"
	    }

        networks: {
            local: {
                url: 'http://127.0.0.1:8545'
	  	}
	}
}
    
}

3) Tenderly login locally with account:
    - tenderly login (follow cmd line steps)

4) Start a local node:
    - npx hardhat node --fork https://eth-mainnet.alchemyapi.io/v2/<tenderly-api-key>

5) Run tests.

6) Copy test transaction and export it to tenderly to view in the dashboard:
    - tenderly export <tx-hash>

7) Click the generated link to view the transaction details.