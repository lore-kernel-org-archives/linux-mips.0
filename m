Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51A44CAEC;
	Wed, 15 Jul 2026 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127965; cv=none; b=Cu3ZceZxJlqjR5oraedzZDf1uRpk3sUReNp5GypckBafnewHohPHm5CMZWPXy6KRwDmMRVqHuDRVWFWnfRINctvaukiXGpj0GwArGsyBpzM/l9PLyXwQPjYEIXyUlS9kgzdzL+jzSgBpmpXXN8C6uFPKJnIWhrsBKleMcUHicY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127965; c=relaxed/simple;
	bh=Y4FmLjPF0/b3y+HBGRwUS7Z+5hM7PMv2BKZnVMAYtdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ry4rL8mOQQSAXi9jG6UBDYr8GHUujqbVP21NU9aGWdNtwPTRP8UlFrixuiKoxbPvACZ8MPwQ8vnZwPpg654eiVrjE8cJHZqZVEy+pN3xmjBcbzZLOmIqgpB1mlnRTIXxw0i1IuMthh8iOoRPeQF2DZv7ZBd9jBSfSHCSz6szFPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqtnkFwH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqtnkFwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784127963; x=1815663963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y4FmLjPF0/b3y+HBGRwUS7Z+5hM7PMv2BKZnVMAYtdU=;
  b=bqtnkFwHbkCsNbDbDuSUoycsqSravlyVlF5Rp8u4EuI+ckke2g6KgWc4
   T0geJndHTTgV6m1b1eFV8T+jl0bpNF+x0rJbOVUcy/gX8GY8/cinx377E
   mF0k2Qtl7E6h52LMZQd7iiYr5DQvOjzWJ/4+UPqio/ZNGWzt66F58mOzm
   SZCrAWAsZUIF6CCyba5QslAITEWNPBu8PdNZ3I0fE4DhE5XNgQ6vLvSUO
   zGr+gwGcy1WeIYtcFayUdLBcE8Mg0ZR4DM/PeQZmIKH4MlvlkSLhUDBwa
   bSFmQ9yCZE8uK0y9jiFBp8tj3v9CG7SyBLY/di99HFNnvazTKm4+ZPlZX
   A==;
X-CSE-ConnectionGUID: SEtS7dOxSIuJAoTI5agcyA==
X-CSE-MsgGUID: TCmiXIPBRyW3MwrHi7W3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="95369298"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="95369298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 08:06:02 -0700
X-CSE-ConnectionGUID: Afqrb080T6expdVUj87Zbg==
X-CSE-MsgGUID: h2LXKO5yRNqVWCmDjBX7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="258166899"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jul 2026 08:06:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E3C6F95; Wed, 15 Jul 2026 17:05:59 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>
Subject: [PATCH v3 1/1] MIPS: Alchemy: Remove unused forward declaration
Date: Wed, 15 Jul 2026 17:03:48 +0200
Message-ID: <20260715150551.1239925-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'struct gpio' is not used in the code, remove unneeded forward declaration.
This seems to be a leftover for a 5 years.

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Cc: Bartosz Golaszewski <brgl@kernel.org>

This patch is floating around for more than a year without anybody
taking it! Please, please, do something about this. Since it has
an ack by MIPS maintainer, Bart, can you just pick this up?

 arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index 912534ecb1a4..c92d3c2a5ef8 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -12,7 +12,6 @@
 #include <asm/io.h>
 #include <asm/mach-au1x00/au1000.h>
 
-struct gpio;
 struct gpio_chip;
 struct software_node;
 
-- 
2.50.1

