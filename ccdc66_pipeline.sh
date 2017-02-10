cd varResults_snps/
bcftools view -Ov -r chr20:33714224-33758846 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > ccdc66.vcf
grep -v "^##" ccdc66.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > ccdc66_tomove.vcf
mv ccdc66_tomove.vcf /vol1/SNPs_NCBI.varEffect/
cd ../SNPs_NCBI.varEffect/
grep -f ccdc66_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > ccdc66_variant_effect.vcf
awk '{print $1}' ccdc66_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_ccdc66_variant_effect.vcf
mv comp_ccdc66_variant_effect.vcf /vol1/varResults_snps/
cd ../varResults_snps/
grep -f comp_ccdc66_variant_effect.vcf ccdc66.vcf > ccdc66_snps_to_excel.vcf
wc -l ccdc66_snps_to_excel.vcf
