Reply-To: <sseeger@stellartec.com>
From: sseeger@stellartec.com (Steven Seeger)
Subject: RE: [patch] wait instruction on vr4181
Date: Thu, 24 Apr 2003 11:09:26 -0700
Message-ID: <078a01c30a8c$a4cb9350$3501a8c0@wssseeger>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20030424093420.C28275@mvista.com>
Return-Path: <sseeger@stellartec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Jun Sun' <jsun@mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20030424180926.1zK3Gdqg82DkhXAVS3uJOl9z6BL3LP-T0TSPF93xx-4@z>

Hey, when I try to patch in standby, it says that opcode isn't available for
the R6000. Why does arch/mips/Makefile use -mcpu=r4600 for the VR41XX?

Steve
