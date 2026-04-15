Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2E30CD80;
	Wed, 15 Apr 2026 02:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776221129; cv=none; b=LevGSiqBt7HB2CB/WuREsHfIY/We7bwZhbQDKLZXN5llpD8Q8OGXh3blCWuW+gM2qJpONvbkVJcKimovD6vFCZMWqByNwMQsV+2AEn+UVtEcZVjqxTgo//htrguOnqlYp6KPdEr4vO0zEQ3hT39G6F4RMp9i/6SIhsMJ6bLtPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776221129; c=relaxed/simple;
	bh=KU7kY5Ef5MZ6eBLhZN0Bf3Su/WDTuUPsWfDvmtQbY90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ5cqYjJWW89BVrpXjftTO/g599iu868n1kQaaOZAmX4g+wrMxn25iktnYZCB3SvcVNakodo+GIuyktLwEL7PTu5bVXirSCDfOH387kXwTRgEJSclQFoQpim4CS+zYEzKuOKU5xoA+XmbojI55hgZODS9w0QiXKoCQn4GPdIE7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vm2djOSK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vm2djOSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776221127; x=1807757127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KU7kY5Ef5MZ6eBLhZN0Bf3Su/WDTuUPsWfDvmtQbY90=;
  b=Vm2djOSKpWne4q3nE0nPGZqqfFiXgNqz5mJWKlWAyEFbUP0aQG6OdQWW
   SxlZoYm2uJcFy8JdYyl9UuZIeNrSMWDwdu1ajmGJaDLcw9B0Z3EbHk1AQ
   32kw5knyXJ7Ufo65ZgJ8q+G1Sg2cHucVPbl5cLzOX8J0Cf66OdFl9Ap+S
   o5ZQIwfhpqwhI8lU6IPUZgg0//FKaH58Q1FT/RZdFzGTxMUcgHnpROcWI
   Jhqn/wqtUWnOsJpikm3xWYoQV+j5yuXw1z8y727HsUbhZes2EjtU2l1Fn
   b6D5N8I/ffYP/n0/d7kriwDZR1RaiW5LRu2fkGZkuTyabjaZtk3cNS3NI
   Q==;
X-CSE-ConnectionGUID: ATfLmruRT661Xt53UrId9A==
X-CSE-MsgGUID: SP9lKnH+To+6dmYtKenHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76357030"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76357030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:45:27 -0700
X-CSE-ConnectionGUID: j4lXBInLQ3WUM5Yg1CtINA==
X-CSE-MsgGUID: Tke3ktotSo2ObN1ZU8ipBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230503589"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Apr 2026 19:45:24 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCqFl-0000000004b-3oK0;
	Wed, 15 Apr 2026 02:45:21 +0000
Date: Wed, 15 Apr 2026 10:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: oe-kbuild-all@lists.linux.dev, yoelvisoliveros@gmail.com,
	len.bao@gmx.us, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604151042.H0SJqN2r-lkp@intel.com>
References: <20260412000226.2711800-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000226.2711800-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260415-004127
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260412000226.2711800-1-m32285159%40gmail.com
patch subject: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604151042.H0SJqN2r-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151042.H0SJqN2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604151042.H0SJqN2r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet.c:23:
   drivers/staging/octeon/octeon-stubs.h:1270:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:1270:49: error: return type is an incomplete type
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h: In function 'cvmx_helper_interface_get_mode':
>> drivers/staging/octeon/octeon-stubs.h:1273:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1273 |         return 0;
         |                ^
   drivers/staging/octeon/octeon-stubs.h:1270:49: note: declared here
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_change_mtu':
   drivers/staging/octeon/ethernet.c:252:14: error: void value not ignored as it ought to be
     252 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_set_multicast_list':
   drivers/staging/octeon/ethernet.c:298:14: error: void value not ignored as it ought to be
     298 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_set_mac_filter':
   drivers/staging/octeon/ethernet.c:350:14: error: void value not ignored as it ought to be
     350 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
   drivers/staging/octeon/ethernet.c:801:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
     801 |                 enum cvmx_helper_interface_mode imode =
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c:801:22: error: variable 'imode' has initializer but incomplete type
   drivers/staging/octeon/ethernet.c:801:49: error: storage size of 'imode' isn't known
     801 |                 enum cvmx_helper_interface_mode imode =
         |                                                 ^~~~~
   drivers/staging/octeon/ethernet.c:801:49: warning: unused variable 'imode' [-Wunused-variable]
--
   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet-mdio.c:15:
   drivers/staging/octeon/octeon-stubs.h:1270:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h:1270:49: error: return type is an incomplete type
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h: In function 'cvmx_helper_interface_get_mode':
>> drivers/staging/octeon/octeon-stubs.h:1273:16: warning: 'return' with a value, in function returning void [-Wreturn-type]
    1273 |         return 0;
         |                ^
   drivers/staging/octeon/octeon-stubs.h:1270:49: note: declared here
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/return +1273 drivers/staging/octeon/octeon-stubs.h

422d97b8b05ed38 Chris Packham 2020-02-05  1269  
8912373dc44ef18 Maxwell Doose 2026-04-11 @1270  static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
422d97b8b05ed38 Chris Packham 2020-02-05  1271  								   interface)
422d97b8b05ed38 Chris Packham 2020-02-05  1272  {
422d97b8b05ed38 Chris Packham 2020-02-05 @1273  	return 0;
422d97b8b05ed38 Chris Packham 2020-02-05  1274  }
422d97b8b05ed38 Chris Packham 2020-02-05  1275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
