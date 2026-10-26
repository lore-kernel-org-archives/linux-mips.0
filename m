Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991781;
	b=SOmgBbTnETJFoHZPIReHv1KrzsP0248snprtJVM3tQ+QBxGruF6Dq2zc3aggHMVXKbLX
	 9w45bgQ1nheDvultohZd9WRxkvD5gE1N28yWys616BBNNjfH2LHlYlf8FuBnbJZTBWIrz
	 MZM+dSxg16yb+7WoRtnx3Au/yj0uiSp7MPsjs6oDaiywgT2ofLkANL24/gywE21viIYNa
	 rLqZHWsbwwYy/IiKJJ9n/aWrPnsZYbz+fRcuPqP9YCAoZMUjKU+6cal/NTfxClLPqKwTA
	 LyubX78ErtH4/+7glKhRNxuhgiJW7wDC3HcjNhyEGqgY3gI9aix/it2r/niThKj5BJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991781;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=FPY7uMWS3gJRnZSftZqSTXUGgjttMjmwRr8ba5P+Pyo=;
	b=VEzUgIjuRLhDePJqGOML7bGaJVG6q++svvedpZTEtSJqTxfYtdn6N0xH49oTYqRkUU+7
	 5x2j6ZFX5w0AocZ88GWO3/53Dvnia2AjB2jyp7tTzB3F6wl7KzHnqEO5S07ihcPaERKm6
	 oFLny6e35mI9tWzxlVPET07gxvgFGXzPfK/bCwa6zuCiI0yl3e76Vad5FBU59aAmFCjnw
	 rTlhjRh2ILDpqdZq1JDVU91cgZ7gvk5rRfhEWLYWTRMjLIPH8t8ZWscOj59p60APKZEJb
	 tN2WeNOmVUG0iL1IEeZY0n01IXYVCwenJLju3EKK+H3uEOJxQO0eT5kVFAwBrugv2+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KqWUxK4t;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E502606A322;
	Mon, 26 Oct 2026 05:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E502606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KqWUxK4t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792991780; x=1824527780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VZBsH9Gc3d1uFr3N5f5EManr9WtzzyQSEkjdd32MNUk=;
  b=KqWUxK4t/OIr8W5yFS5LWQpBBi7Oi8wbT8FgGoaYzbYMd7eoGuBCAL/u
   omTe79FayAvHjg9Yy6PMtGbQLS2JBCE26mKutW9dvM1dAlcl6iwj/W1mX
   /O5Ep3ONBr6LJ2+MjrcN5xUKl2vNNeDnsJpnKwYquiD27krlHHJ+U+REY
   SKcsrhJoTKkXVYnnvk7MUeQu1x3WvAUnNdaekmCdv4sI0Ug1ko3tJK4CJ
   XqreaHKyDHoJKcelh2z5Hf71PtPCNqfmj34ioveu+BwXvH8sDXdj1e03/
   S4cB8wLhilQz40k46U5NJPbvpldo73lVVY+qoYpaCdhMwqqLdfKo5j++j
   w==;
X-CSE-ConnectionGUID: KdFBApJZSVCt9X0pr6jZAg==
X-CSE-MsgGUID: DLxSn58GRfaKM27y/bOPNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1637575"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1637575"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:16:20 -0700
X-CSE-ConnectionGUID: EwpBZi60RGGHAkyP7SVYGg==
X-CSE-MsgGUID: 6TVeHbr+SneqFZFQgwE5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5925800"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 25 Oct 2026 22:16:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLD4A-00000000VTW-0AiY;
	Mon, 26 Oct 2026 05:16:14 +0000
Date: Mon, 26 Oct 2026 13:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Burton <paulburton@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 3/6] MIPS: Ingenic: Add cpu-probe setup for XBurst and
 XBurst II R2
Message-ID: <202610261320.3AF5hDGi-lkp@intel.com>
References: <1658997f198411f20bc5a489e9488800e4597e19.1792956055.git.hns@goldelico.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1658997f198411f20bc5a489e9488800e4597e19.1792956055.git.hns@goldelico.com>

Hi Nikolaus,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3 next-20261023]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/MIPS-Ingenic-Fix-inverted-MIPS_NO_APPENDED_DTB-logic-in-Kconfig/20261025-202050
base:   linus/master
patch link:    https://lore.kernel.org/r/1658997f198411f20bc5a489e9488800e4597e19.1792956055.git.hns%40goldelico.com
patch subject: [PATCH 3/6] MIPS: Ingenic: Add cpu-probe setup for XBurst and XBurst II R2
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20261026/202610261320.3AF5hDGi-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261320.3AF5hDGi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610261320.3AF5hDGi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/cpu-probe.c: In function 'cpu_probe_ingenic':
>> arch/mips/kernel/cpu-probe.c:1840:30: error: 'CPU_XBURST2' undeclared (first use in this function); did you mean 'CPU_XBURST'?
    1840 |                 c->cputype = CPU_XBURST2;
         |                              ^~~~~~~~~~~
         |                              CPU_XBURST
   arch/mips/kernel/cpu-probe.c:1840:30: note: each undeclared identifier is reported only once for each function it appears in


vim +1840 arch/mips/kernel/cpu-probe.c

  1751	
  1752	static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
  1753	{
  1754		decode_configs(c);
  1755	
  1756		/*
  1757		 * XBurst misses a config2 register, so config3 decode was skipped in
  1758		 * decode_configs().
  1759		 */
  1760		decode_config3(c);
  1761	
  1762		/* XBurst does not implement the CP0 counter. */
  1763		c->options &= ~MIPS_CPU_COUNTER;
  1764		BUG_ON(__builtin_constant_p(cpu_has_counter) && cpu_has_counter);
  1765	
  1766		/* XBurst has virtually tagged icache */
  1767		c->icache.flags |= MIPS_CACHE_VTAG;
  1768	
  1769		switch (c->processor_id & PRID_IMP_MASK) {
  1770	
  1771		/* XBurst®1 with ISA */
  1772		case PRID_IMP_XBURST:
  1773			c->cputype = CPU_XBURST;
  1774			c->writecombine = _CACHE_UNCACHED_ACCELERATED;
  1775			__cpu_name[cpu] = "Ingenic XBurst";
  1776			break;
  1777	
  1778		/* XBurst®1 with MXU1.0/MXU1.1 SIMD ISA */
  1779		case PRID_IMP_XBURST_REV1:
  1780	
  1781			/*
  1782			 * The XBurst core by default attempts to avoid branch target
  1783			 * buffer lookups by detecting & special casing loops. This
  1784			 * feature will cause BogoMIPS and lpj calculate in error.
  1785			 * Set cp0 config7 bit 4 to disable this feature.
  1786			 */
  1787			set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
  1788	
  1789			switch (c->processor_id & PRID_COMP_MASK) {
  1790	
  1791			/*
  1792			 * The config0 register in the XBurst CPUs with a processor ID of
  1793			 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
  1794			 * but they don't actually support this ISA.
  1795			 */
  1796			case PRID_COMP_INGENIC_D0:
  1797				c->isa_level &= ~MIPS_CPU_ISA_M32R2;
  1798	
  1799				/* FPU is not properly detected on JZ4760(B). */
  1800				if (c->processor_id == 0x2ed0024f)
  1801					c->options |= MIPS_CPU_FPU;
  1802	
  1803				fallthrough;
  1804	
  1805			/*
  1806			 * The config0 register in the XBurst CPUs with a processor ID of
  1807			 * PRID_COMP_INGENIC_D0 or PRID_COMP_INGENIC_D1 has an abandoned
  1808			 * huge page tlb mode, this mode is not compatible with the MIPS
  1809			 * standard, it will cause tlbmiss and into an infinite loop
  1810			 * (line 21 in the tlb-funcs.S) when starting the init process.
  1811			 * After chip reset, the default is HPTLB mode, Write 0xa9000000
  1812			 * to cp0 register 5 sel 4 to switch back to VTLB mode to prevent
  1813			 * getting stuck.
  1814			 */
  1815			case PRID_COMP_INGENIC_D1:
  1816				write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
  1817				break;
  1818	
  1819			default:
  1820				break;
  1821			}
  1822			fallthrough;
  1823	
  1824		/* XBurst®1 with MXU2.0 SIMD ISA */
  1825		case PRID_IMP_XBURST_REV2:
  1826			/* Ingenic uses the WA bit to achieve write-combine memory writes */
  1827			c->writecombine = _CACHE_CACHABLE_WA;
  1828			c->cputype = CPU_XBURST;
  1829			__cpu_name[cpu] = "Ingenic XBurst";
  1830			break;
  1831	
  1832		/* XBurst®2 with MXU2.1 SIMD ISA */
  1833		case PRID_IMP_XBURST2:
  1834			c->cputype = CPU_XBURST;
  1835			__cpu_name[cpu] = "Ingenic XBurst II";
  1836			break;
  1837	
  1838		/* XBurst®2 with MXU3.0 SIMD ISA */
  1839		case PRID_IMP_XBURST2_R2:
> 1840			c->cputype = CPU_XBURST2;
  1841			c->writecombine = _CACHE_UNCACHED_ACCELERATED;
  1842			__cpu_name[cpu] = "Ingenic XBurst II R2";
  1843			break;
  1844	
  1845		default:
  1846			panic("Unknown Ingenic Processor ID!");
  1847			break;
  1848		}
  1849	}
  1850	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
