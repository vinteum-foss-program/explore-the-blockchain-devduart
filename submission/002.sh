# (true / false) Verify the signature by this address over this message:
#   address: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   message: `1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa`
#   signature: `HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM=`
#  Resposta: A assinatura é inválida: false

#!/bin/bash

# Function to verify the signature
verificar_assinatura() {
    local address="$1"
    local message="$2"
    local signature="$3"

    # Run the bitcoin-cli verifymessage command
    local result
    result=$(bitcoin-cli verifymessage "$address" "$signature" "$message" 2>&1)

    # Check for errors in the command
    if [[ "$result" == *"error code"* ]]; then
        echo "Erro ao verificar a assinatura: $result"
        return 1
    fi

    # Return the verification result
    if [ "$result" == "true" ]; then
        echo "A assinatura é válida: true"
    else
        echo "A assinatura é inválida: false"
    fi
}

# Inputs
address="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"
message="1E9YwDtYf9R29ekNAfbV7MvB4LNv7v3fGa"
signature="HCsBcgB+Wcm8kOGMH8IpNeg0H4gjCrlqwDf/GlSXphZGBYxm0QkKEPhh9DTJRp2IDNUhVr0FhP9qCqo2W0recNM="

# Call the function
verificar_assinatura "$address" "$message" "$signature"

