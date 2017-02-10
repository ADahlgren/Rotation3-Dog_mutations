cd varResults_snps/
bcftools view -Ov -r chr20:21839457-21870578 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > mitf.vcf
grep -v "^##" mitf.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > mitf_tomove.vcf
mv mitf_tomove.vcf /vol1/SNPs_NCBI.varEffect/
cd ../SNPs_NCBI.varEffect/
grep -f mitf_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > mitf_variant_effect.vcf
awk '{print $1}' mitf_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_mitf_variant_effect.vcf
mv comp_mitf_variant_effect.vcf /vol1/varResults_snps/
cd ../varResults_snps/
grep -f comp_mitf_variant_effect.vcf mitf.vcf > mitf_snps_to_excel.vcf
wc -l mitf_snps_to_excel.vcf
