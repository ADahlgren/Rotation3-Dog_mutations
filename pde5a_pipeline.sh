cd varResults_snps/
bcftools view -Ov -r chr32:38275356-38405920 GenotypeGVCFs_output_max50.raw_SNPs.vcf.gz > pde5a.vcf
grep -v "^##" pde5a.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > pde5a_tomove.vcf
mv pde5a_tomove.vcf /vol1/SNPs_NCBI.varEffect/
cd ../SNPs_NCBI.varEffect/
grep -f pde5a_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > pde5a_variant_effect.vcf
awk '{print $1}' pde5a_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_pde5a_variant_effect.vcf
mv comp_pde5a_variant_effect.vcf /vol1/varResults_snps/
cd ../varResults_snps/
grep -f comp_pde5a_variant_effect.vcf pde5a.vcf > pde5a_to_excel.vcf
wc -l pde5a_to_excel.vcf
