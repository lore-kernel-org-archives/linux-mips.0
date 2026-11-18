Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038418;
	b=vBlBdkkvVfqxcJ6ClPPOsdHGO7uj4E49m5MBZoHsiX/on1ldkIz8YCMdhZ9YHsCdKcn2
	 gzMuCJtkDLfNwuuZIzwzbciCfo8iyS6T2DsROhG6L93TnASkyliZXeHn5zZdEuvrKJgjD
	 rk/JnQWWiESmDgjP7/RbPXk0ICykyXOq6dzMRPNV2ImiqlRcr5KVUHqHySyFP385REnWf
	 FbqqsRNI8BWA+RCgs87CSFPA4/xmjPxYiKRQABbtkiSvJG9yOAorlajebvtV9O54NJbiq
	 aNGqoRgwOEQlljNIyBxbFcJXmlFABQlq0E9DKxDGmRPNKiOkzFqN8QAfcQweXB9EvGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038418;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Organization:Content-Transfer-Encoding;
	bh=aGR4iuKnu1EEiFADAbLTxDuM0KFENmS+N8qPw85NZfo=;
	b=gicpK5CbWTooAwIpRR3oAuYG0w1Ad9SgsqVEFKJ7Z1AMW+S3pZ1Nso4CR2NoR1ZcbIc/
	 G/xAExSZ7JEG8eR5bypAj14cE7dp9u837o07vRO6w1S/s1ABC7OzCjr89Css8xvJCX593
	 3sHNl0QpBzLGQ7BkKTM6mmwNXId9QyxgeCp8aCKosAklImgaQQX+uvfvxGdBsdYV5V9rT
	 +dFHPa0kQ3MPxbY3mzp3VDFk8wkgrzPUBWI1eYeyOLXEdEmuly8h/2E+w2gFdA7VePWdS
	 0KGOTYUpGVL3//u1FQzgvlsmDWXu7iTo6JSPyxKy0GxmaO8oytO7J2gzlHJeWVYjPkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQr54xma;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89872606A325
	for <linux-mips@vger.kernel.org>; Wed, 18 Nov 2026 21:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89872606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cQr54xma
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795038419; x=1826574419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EXB2NoXA6MeZnH2rWbnsokLAI4ztjY39cwi7mHoJhhQ=;
  b=cQr54xmaS6V2G0ocsL+MDjXZZMK0CPKcF2OS0WhYXk6B+kMPiHQi1mNM
   5QA41UfgEl4kZnjvbf0YrajPFTUW3LtcH9v3SlqlqM7Wxvufif3Q0pULw
   NHAmJ0x2I8Wxi7i+ehZV8zsG8kffKK15jsFEQXPkwpTbsNUwbHK1XYuMD
   XSGBAREohBDpMOjlcdjmplkd/H6YDH9PUHljwNy7ZjlUvjQrKwwZr4sC+
   P/4mu4/ZnSeecoaeH9caTqJhnudlEpbOHCl6uB45Inmn3sVPMgeYs4Rbg
   ZmATa8GyascnkxCpu/uOXoRj3EUWe69UVzaTEmAf5RrCIvCmrj5yXWQdp
   w==;
X-CSE-ConnectionGUID: iCl5uHlYQomC9qm+RCX/QA==
X-CSE-MsgGUID: v5wL16snTGSJBINPhTetZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3862628"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3862628"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:59 -0800
X-CSE-ConnectionGUID: dA8G4BQYR8GF+QDZVIrCyQ==
X-CSE-MsgGUID: 5xzNfAKXRASTd1gwBN5XWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10258579"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:46:57 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org
Subject: [PATCH v4 18/20] drm/ingenic: Allow ingenic-dw-hdmi build with COMPILE_TEST=y
Date: Wed, 18 Nov 2026 23:45:15 +0200
Message-ID: <20261118214518.29317-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow DRM_INGENIC_DW_HDMI to be built with COMPILE_TEST=y for greater
coverage. The rest of the ingenic driver already allows this. Builds
fine on x86, x86_64, arm and arm64 at least.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/ingenic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 987ed42f6f7a..60bff9ebee5d 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -31,7 +31,7 @@ config DRM_INGENIC_IPU
 
 config DRM_INGENIC_DW_HDMI
 	tristate "Ingenic specific support for Synopsys DW HDMI"
-	depends on MACH_JZ4780
+	depends on MACH_JZ4780 || COMPILE_TEST
 	select DRM_DW_HDMI
 	help
 	  Choose this option to enable Synopsys DesignWare HDMI based driver.
-- 
2.56.0

