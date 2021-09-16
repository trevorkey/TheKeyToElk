#!/bin/bash
grep '08:00:00 AM' $1 | awk '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' >> Dealers_working_during_losses
