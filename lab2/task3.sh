#!/bin/bash

grep -sraohE "[a-zA-Z0-9._-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}" /etc >emails.lst
