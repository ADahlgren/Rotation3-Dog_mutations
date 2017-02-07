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
