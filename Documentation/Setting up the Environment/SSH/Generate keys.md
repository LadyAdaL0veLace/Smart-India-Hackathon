# Generate ssh keys

1. RSA (Rivest-Shamir-Adleman):
`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

2. SA (Digital Signature Algorithm):
`ssh-keygen -t dsa -b 1024 -C "your_email@example.com"`

3. ECDSA (Elliptic Curve Digital Signature Algorithm):
`ssh-keygen -t ecdsa -b 256 -C "your_email@example.com"`

4. Ed25519:
`ssh-keygen -t ed25519 -C "your_email@example.com"`

- In each of these commands:   
-t specifies the type of key to generate.   
-b specifies the number of bits in the key (applicable to RSA and DSA keys).    
-C specifies a comment associated with the key, usually your email address.     

