#---
# Excerpted from "The Cucumber Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/hwcuc for more book information.
#---
rm -Rf 00
cp -R ../message_queues/03 00
cd 00
patch --no-backup-if-mismatch -p3 < ../00.diff
../../../script/build-cukes

# Break line in output
sed -i '' -e 's/undefined local.*$/\
&/' features/cash_withdrawal.cucumberansi

cat features/cash_withdrawal.cucumberansi