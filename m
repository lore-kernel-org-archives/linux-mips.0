Received: from templar ([10.0.0.2])
	by bard.illuminatus.org with esmtp (Exim 3.35 #1 (Debian))
	id 17wHww-0003ik-00
	for <linux-mips@linux-mips.org>; Tue, 01 Oct 2002 01:00:10 -0700
Subject: scatterlist.h
From: Mike Nugent <mips@illuminatus.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Oct 2002 01:48:38 -0700
Message-ID: <1033462118.13267.97.camel@templar>
Mime-Version: 1.0
Return-Path: <mips@illuminatus.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021001084838.M_N_qtE9kQJGCdv9ZvTSSPbY5Xy4nr5nLe9tPVxg9jY@z>


Next problem  ( I know you all love my by now :)

in drivers/scsi/scsi_merge.c

scsi_merge.c:939: structure has no member named `page'

line 939: sgpnt[count - 1].page = NULL;

(struct scatterlist *sgpnt;  included from scsi.h, which includes
asm/scatterlist.h)


struct scatterlist {
    char *  address;    /* Location data is to be transferred to */
    unsigned int length;

    __u32 dvma_address;
};

Yes!  It's right!  No member page!
