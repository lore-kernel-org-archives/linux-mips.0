Reply-To: <a.voropay@vmb-service.ru>
From: "Alec Voropay" <a.voropay@vmb-service.ru>
Subject: PATCH:  JAZZ jazzdma.c  linux_2_4
Date: Fri, 15 Oct 2004 21:35:49 +0400
Message-ID: <013201c4b2dd$6c4e64d0$1701a8c0@vmbservice.ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-Path: <a.voropay@vmb-service.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041015173549.485By7ShrV5sjfvXE7dy5RjwBIA2L2zksEfCnIiLvcU@z>



Spellcheck


diff -Naur -p -X dontdiff linux_2_4/arch/mips/jazz/jazzdma.c
linux_2_4-jazz/arch/mips/jazz/jazzdma.c
--- linux_2_4/arch/mips/jazz/jazzdma.c  Wed Oct 22 04:29:14 2003
+++ linux_2_4-jazz/arch/mips/jazz/jazzdma.c     Fri Oct 15 20:44:52 2004
@@ -108,7 +108,7 @@ unsigned long vdma_alloc(unsigned long p
                return VDMA_ERROR;      /* invalid physical address */
        }

-       spin_lock_saveirq(&jazz_dma_lock, flags);
+       spin_lock_irqsave(&jazz_dma_lock, flags);

        /*
         * Find free chunk
@@ -120,7 +120,7 @@ unsigned long vdma_alloc(unsigned long p
                       first < VDMA_PGTBL_ENTRIES) first++;
                if (first + pages > VDMA_PGTBL_ENTRIES) {
                        /* nothing free */
-                       spin_unlock_restoreirq(&jazz_dma_lock, flags);
+                       spin_unlock_irqrestore(&jazz_dma_lock, flags);
                        return VDMA_ERROR;
                }

@@ -167,7 +167,7 @@ unsigned long vdma_alloc(unsigned long p
                printk("\n");
        }

-       spin_unlock_restoreirq(&jazz_dma_lock, flags);
+       spin_unlock_irqrestore(&jazz_dma_lock, flags);

        return laddr;
 }
