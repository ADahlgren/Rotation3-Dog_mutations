cd varResults_snps/
bcftools view -Ov -r chr24:46653400-46669183 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > col9a3.vcf
grep -v "^##" col9a3.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > col9a3_tomove.vcf
mv col9a3_tomove.vcf /vol1/SNPs_NCBI.varEffect/
cd ../SNPs_NCBI.varEffect/
grep -f col9a3_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > col9a3_variant_effect.vcf
awk '{print $1}' col9a3_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_col9a3_variant_effect.vcf
mv comp_col9a3_variant_effect.vcf /vol1/varResults_snps/
cd ../varResults_snps/
grep -f comp_col9a3_variant_effect.vcf col9a3.vcf > col9a3_snps_to_excel.vcf
wc -l col9a3_snps_to_excel.vcf
