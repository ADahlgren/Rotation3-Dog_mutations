#To select SNPs in gene of interest
bcftools view -Ov -r chr20:53091482-53107084 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > adamts10.vcf
#To alter format in order to easily compare to variant_output.txt file
grep -v "^##" adamts10.vcf | awk '{print $1, $2}'| sed 's/chr//1' | sed 's/ /_/g' | awk '{$1=$1 "_"}1' > adamts10_2.vcf

#same process for other genes
bcftools view -Ov -r chr20:21839457-21870578 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > mitf.vcf
grep -v "^##" mitf.vcf | awk '{print $1, $2}'| sed 's/chr//1' | sed 's/ /_/g' | awk '{$1=$1 "_"}1' > mitf_2.vcf
grep -f mitf_2.vcf variant_effect_output.txt | awk '/HIGH/' > high_mitf_variant_effect.vcf
uniq high_mitf_variant_effect.vcf > mitf_uniq.vcf
grep -f mitf_uniq.vcf mitf.vcf > samples.vcf

bcftools view -Ov -r chr20:21839457-21870578 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > mitf.vcf
grep -v "^##" mitf.vcf | awk '{print $1, $2}'| sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > mitf_tomove.vcf #move to SNPs directory
grep -f mitf_tomove.vcf variant_effect_output.txt | awk '/HIGH/ {print $1}' | sed 's/_/ /g' | awk '{print $2}' | uniq > high_mitf_variant_effect.vcf #move back to varResults file
grep -f high_mitf_variant_effect.vcf mitf.vcf > mitf_to_excel.vcf


#tried for CCDC66 - no INDELs found; one SNP found, but doesn't look to be very interesting
bcftools view -Ov -r chr20:33714224-33758846 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > ccdc66.vcf
grep -v "^##" ccdc66.vcf | awk '{print $1, $2}'| sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > ccdc66_tomove.vcf
mv ccdc66_tomove.vcf /vol1/SNPs_NCBI.varEffect/
grep -f ccdc66_tomove.vcf variant_effect_output.txt | awk '/HIGH/ {print $1}' | sed 's/_/ /g' | awk '{print $2}' | uniq >
high_ccdc66_variant_effect.vcf
mv high_ccdc66_variant_effect.vcf /vol1/varResults_snps/
grep -f high_ccdc66_variant_effect.vcf ccdc66.vcf > ccdc66_to_excel.vcf

#tried COL9A2 - no INDELS or SNPs
#COL9A3 - no Indels; SNPs=2 but not associated with breeds
bcftools view -Ov -r chr24:46653400-46669183 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > col9a3.vcf
grep -v "^##" col9a3.vcf | awk '{print $1, $2}'| sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > col9a3_tomove.vcf
mv col9a3_tomove.vcf /vol1/SNPs_NCBI.varEffect/
grep -f col9a3_tomove.vcf variant_effect_output.txt| awk '/HIGH/ {print $1}' | sed 's/_/ /g' | awk '{print $2}' | uniq > high_col9a3_variant_effect.vcf
mv high_col9a3_variant_effect.vcf /vol1/varResults_snps/
grep -f high_col9a3_variant_effect.vcf col9a3.vcf > col9a3_to_excel.vcf

#CUBN - nada

#HLA-DRB1 (MHC gene- lots of variation between breeds but not a ton within); connection to rheumatoid arthritis
bcftools view -Ov -r chr12:2151409-2164564 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > hla-drb1.vcf
grep -v "^##" hla-drb1.vcf | awk '{print $1, $2}'| sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > hla-drb1_tomove.vcf
mv hla-drb1_tomove.vcf /vol1/SNPs_NCBI.varEffect/
grep -f hla-drb1_tomove.vcf variant_effect_output.txt | awk '/HIGH/ {print $1}' | sed 's/_/ /g' | awk '{print $2}' | uniq > hla-drb1_variant_effect.vcf
mv hla-drb1_variant_effect.vcf /vol1/varResults_snps/
grep -f hla-drb1_variant_effect.vcf hla-drb1.vcf > hla-drb1_to_excel.vcf
bcftools view -Ov -r chr12:2151409-2164564 GenotypeGVCFs_output_max50.raw_INDELs.vcf.gz > hla-drb1.vcf
grep -v "^##" hla-drb1.vcf | awk '{print $1, $2}'| sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > hla-drb1_tomove.vcf
mv hla-drb1_tomove.vcf /vol1/INDELs_NCBI.varEffect/
grep -f hla-drb1_tomove.vcf variant_effect_output.txt | awk '/HIGH/ {print $1}' | sed 's/_/ /g' | awk '{print $2}' | uniq > hla-drb1_variant_effect.vcf
mv hla-drb1_variant_effect.vcf /vol1/varResults_indels/
grep -f hla-drb1_variant_effect.vcf hla-drb1.vcf > hla-drb1_indels_to_excel.vcf

#PTDRD, PARD3B, COL15A1, PMEL/SILV, TPP1, PFKM, NPHP4, NES, PRCD, DNM1, NRAS, PTEN, RPE65, SLC4A3

#see pipelines for PNPLA1, PDE5A (different mutation found than in lit)

