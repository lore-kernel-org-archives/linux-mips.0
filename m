Received: from mga02.intel.com ([134.134.136.20]:35318 "EHLO mga02.intel.com")
	by ftp.linux-mips.org with ESMTP id S20026145AbXLCRBF convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 3 Dec 2007 17:01:05 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: RE: [PATCH 2/2] MIPS: vmlinux.lds.S: handle .{init,exit}.bss sections
Date: Mon, 3 Dec 2007 09:00:49 -0800
Message-ID: <617E1C2C70743745A92448908E030B2A030FE4C2@scsmsx411.amr.corp.intel.com>
In-Reply-To: <1196543586-6698-3-git-send-email-fbuihuu@gmail.com>
References: <1196543586-6698-1-git-send-email-fbuihuu@gmail.com> <1196543586-6698-3-git-send-email-fbuihuu@gmail.com>
From: "Luck, Tony" <tony.luck@intel.com>
Return-Path: <tony.luck@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Franck Bui-Huu <fbuihuu@gmail.com>, linux-arch@vger.kernel.org
Cc: macro@linux-mips.org, linux-mips@linux-mips.org
Message-ID: <20071203170049.0MlsVvy0M6FFu20nt3MCAjM4UiNq28nAo7j5shjHJbE@z>

+	/*
+	 * We keep init/exit bss sections here to have only one
+	 * segment to load. Note that .bss.exit is also discarded
+	 * at runtime for the same reason as above.
+	 */
+	.exit.bss : {
+		*(.bss.exit)
+	}

This change would also require an audit of the bootloader or early
kernel initialization code (whichever handles zeroing of .bss space)
to make sure that it understands that the kernel will now have an
extra block of memory that needs to be cleared.  Perhaps nothing
needs to be done if the code already handled the general case of
loading an ELF binary with some sections that have an in-memory
size bigger than the on-disk size.  But worth looking at in case
the code makes an assumption about what needs to be zeroed.

-Tony
