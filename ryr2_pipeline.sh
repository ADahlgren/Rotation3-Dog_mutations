cd varResults_indels/
bcftools view -Ov -r chr4:2368327-3099697 GenotypeGVCFs_output_max50.raw_INDELs.vcf.gz > ryr2.vcf
grep -v "^##" ryr2.vcf | awk '{print $1, $2}' | sed 's/chr//1;s/ /_/g' | awk '{$1=$1 "_"}1' > ryr2_tomove.vcf
mv ryr2_tomove.vcf /vol1/INDELs_NCBI.varEffect/
cd ../INDELs_NCBI.varEffect/
grep -f ryr2_tomove.vcf variant_effect_output.txt | awk '/HIGH/' > ryr2_variant_effect.vcf
awk '{print $1}' ryr2_variant_effect.vcf | sed 's/_/ /g' | awk '{print $2}' | uniq > comp_ryr2_variant_effect.vcf
mv comp_ryr2_variant_effect.vcf /vol1/varResults_indels/
cd ../varResults_indels/
grep -f comp_ryr2_variant_effect.vcf ryr2.vcf > ryr2_to_excel.vcf
wc -l ryr2_to_excel.vcf
