Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A915376BF2;
	Sat, 19 Sep 2026 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830897; cv=none; b=dcc3WZ+AJHSPRkI1b6WixkGt2RTkIPinUCdrXA1E6OGMtMtBL/mudLiHE50A7jqhFWwRjMPVzhLI4DKQ8c8EOBLHmH00vcWBaDR7nKsw6XvDrdspy+6NftQyARTH1zmizewyp5bJBMLDTobkVdxun8fcAO7oiegMjgNchNdRb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830897; c=relaxed/simple;
	bh=SPdq/kmmocxg5fgj8tNd6+OXdGo7o9xYvueh3Gbg398=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z/5tGGopM7SHCXMrPjJXcOWlH2YOX1f/5hWfHgqiGeNd35K9Ly2yo43JTMzXNrCEq/DxP7BVoJtH2WiesOg5mblQLHl7lhbO43nNS/BZJDt/3gOd+KkouqDjOlu9nl8S411pJZCGEbuFlcRwAdWi1iiyGeBVc7R3nnSfsl4e1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 27F6C92009D; Sat, 19 Sep 2026 17:14:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2553992009C;
	Sat, 19 Sep 2026 16:14:55 +0100 (BST)
Date: Sat, 19 Sep 2026 16:14:55 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: WangYuli <wangyuli@aosc.io>, Chen Linxuan <chenlinxuan@uniontech.com>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] MIPS: Reword KBUILD_SYM32 documentation for clarity
In-Reply-To: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2609191559480.27665@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2609191504030.27665@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

It is currently hard to figure out what the inline documentation for the 
KBUILD_SYM32 option means as it speaks in generic build/ELF format terms 
which can mean just about anything, while the whole point of the option 
is whether kernel symbols can or cannot fit in the 32-bit value range.

Adjust the description accordingly and also quote the more correct 'n' 
rather than 'no' setting (even though all that matters is whether it's 
'y' or not).

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
New change in v3.
---
 arch/mips/Makefile |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

linux-mips-msym32-doc.diff
Index: linux-macro/arch/mips/Makefile
===================================================================
--- linux-macro.orig/arch/mips/Makefile
+++ linux-macro/arch/mips/Makefile
@@ -285,10 +285,12 @@ cflags-y			+= -I$(srctree)/arch/mips/inc
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
-# Automatically detect the build format. By default we choose
-# the elf format according to the load address.
-# We can always force a build with a 64-bits symbol format by
-# passing 'KBUILD_SYM32=no' option to the make's command line.
+# Automatically detect whether to build a 64-bit kernel using symbols
+# limited to 32-bit values, which produces more compact code.  This
+# relies on the kernel image being linked at a 32-bit load address,
+# which we use to infer whether to use this arrangement for symbols.
+# Use 'make KBUILD_SYM32=n' to override this default choice and force
+# 64-bit symbols to be used instead.
 #
 ifdef need-compiler
   ifdef CONFIG_64BIT
