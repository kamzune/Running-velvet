##The first step is to create a shuffled file of all the 400 genomes short reads
#!/bin/sh
cd ~direko/results
###Get the pairwise reads into separate directories
mkdir R1
#copy R1
for i in $(ls ./fastq/*_.R1.fastq.gz); do cp $i R1/; done
mkdir R2
#copy R2
for i in $(ls ./fastq/*_.R2.fastq.gz); do cp $i R2/; done
##shuffle the reads into one file for velveth
for i in ./R1/*_.R1.fastq; do for j in ./R2/*_.R2.fastq; do perl ./shuffleSequences_fastq.pl $i $j ./$i"_shuffl.fastq"; done; done
##run velveth to get hashes for velvetg, which assembles using the debruijn graph algorithm
