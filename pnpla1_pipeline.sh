cd varResults_indels/
bcftools view -Ov -r chr12:5377430-5423556 GenotypeGVCFs_output_max50.raw_INDELs.vcf.gz > pnpla1.vcf
grep -v "^##" pnpla1.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > pnpla1_tomove.vcf
mv pnpla1_tomove.vcf /vol1/INDELs_NCBI.varEffect/
cd ../INDELs_NCBI.varEffect/
grep -f pnpla1_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > pnpla1_variant_effect.vcf
awk '{print $1}' pnpla1_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_pnpla1_variant_effect.vcf
mv comp_pnpla1_variant_effect.vcf /vol1/varResults_indels/
cd ../varResults_indels/
grep -f comp_pnpla1_variant_effect.vcf pnpla1.vcf > pnpla1_to_excel.vcf
wc -l pnpla1_to_excel.vcf
