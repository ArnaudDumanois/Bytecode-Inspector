"""
Ce code python sera simplement une fonction prend en entrée un fichier contenant le btyecode Solidity 
et va le décoder afin de chercher la chaine de caractere "Hello from the SmartContract"
"""
import sys
import binascii

def inspect_bytecode(file_path: str) -> str:
    with open(file_path, "r") as file:
        bytecode = file.read().strip()  
    try:
        bytecode_binary = binascii.unhexlify(bytecode)
    except binascii.Error as e:
        return f"Erreur lors du décodage du bytecode : {e}"

    search_string = b"Hello from the SmartContract"
    if search_string in bytecode_binary:
        return "Le bytecode contient la chaîne de caractères 'Hello from the SmartContract'"
    else:
        return "Le bytecode ne contient pas la chaîne de caractères 'Hello from the SmartContract'"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 inspect_bytecode.py <chemin_vers_fichier.bin>")
        sys.exit(1)
    file_path = sys.argv[1]
    print(inspect_bytecode(file_path))
