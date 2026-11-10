Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294184;
	b=1SeKqj+RqZ8vuru0sE1p7c7o/kKNtskGAeuI/4R1he428mzmi9hClmeQ2N+p6NbVX2T3
	 QWjLTzpmob8Q7QL025bSY/BcZqFZ5ndJiHGVsYSy7kT+eEXUYuclxGS0iczfSGNTSb9k5
	 YlHXpSOQJtG5t+saTUSgGX67xUaKa5KdsgxMm2if9t9WZopBYi/i3tbZz/JVmgfc6CuQT
	 5DDWOlztgtHRG2KrNiB+2mPb6U6hHq6t9WD6nuIV6SJUc8ispw129TeZLFAWB4VYUT+sb
	 mhyC7zC9XXP/NZIkF9gBwFzkXeqmN7iNTcvdL/dtheYGXZWiRaTUradOMkbj4oULXVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294184;
	h=DMARC-Filter:DKIM-Signature:From:Date:Content-Transfer-Encoding:To:
	 Message-Id:References:Cc:Received:In-Reply-To:X-Lms-Return-Path:
	 X-Mailer:Subject:Mime-Version:X-Original-From:Content-Type;
	bh=AQ6PmIZO68yetAWhyb5dnFveB4R9S1m9N+UaLksBrPo=;
	b=SF7lNVavdMrLzVCKJ4YV3Jb/nlFETRTgpNyipJzSItYqpk5JHEjf8qWwr0eb5dD1hnEk
	 b6SPuItehkwjEk3QYwMdlJkLfxj+C3P54a3Wt06RVzx3njVLw8/6XcMB97BSsSyjFBjrK
	 ++0hxxb0o+0bHeAFdws05whaO+G6bclpMvD5fnTN1+fo3CPXG67Pf3vdzkm/6ZVmXGWo2
	 Hwy6S+vjOJ86MjHLi8DSOu19JBDRrx6Ync1Mg8xkuKPYz0wOBom+AalVHpWquvr4h8Or1
	 Q+3dL2Og0WpM4S/sp2x51nrVv7X9u6ZLpCWZpt1HquMLfx4m26i7QpBMvhjksUVNV1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=ovDS4SwN;
	arc=none smtp.remote-ip=209.127.231.57
Received: from va-2-57.ptr.blmpb.com (va-2-57.ptr.blmpb.com [209.127.231.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A32860A2629
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 07:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A32860A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=ovDS4SwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794294178;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=AQ6PmIZO68yetAWhyb5dnFveB4R9S1m9N+UaLksBrPo=;
 b=ovDS4SwNSEoGFWjIuG+H+YQXw9cP+/Nt0Yp7NvBqz2auYQORGXzJNZbbvc3zXNqe3a9DKW
 cGKLcFy5tVtUJwYWCqQKtor/FOHdbR/Dqmk2GX+wDWm9Bc47g5mCu4HwC1AQUPjQ/1Uw6F
 ivKw3MDD8UUvRSYZfoQv34DfGkza68qCfohVHxra1B4khRN+p8a++e7SG6/XDTXKeLJ8zq
 G60LskjTbILWbemLFzL2m75PxZVsXSNOCmzGi5cpwOK6yRINR/++2axN+pwNHU2qrzz/5Y
 hckG04kFgpVTy5wAQJGCyWiJKzvVa50kxId9mjtqAgtW6kTzUx5yd6hs8SsWxw==
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 10 Nov 2026 15:02:33 +0800
Content-Transfer-Encoding: 7bit
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Message-Id: <20261110-mips-ls7a-wdt-v1-4-968bb85122e6@oss.cipunited.com>
References: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Received: from [127.0.1.1] ([1.192.71.23]) by smtp.feishu.cn with ESMTPS; Tue, 10 Nov 2026 15:02:56 +0800
In-Reply-To: <20261110-mips-ls7a-wdt-v1-0-968bb85122e6@oss.cipunited.com>
X-Lms-Return-Path: <lba+26af2c1a0+3067dd+vger.kernel.org+rongrong@oss.cipunited.com>
X-Mailer: b4 0.17-dev-ce4c1
Subject: [PATCH 4/4] MIPS: loongson3_defconfig: Enable LOONGSON1_WDT by default
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8

The Loongson-7A has a watchdog. With proper support added to the
loongson1_wdt driver and a relevant node added to ls7a-pch.dtsi, enable
LOONGSON1_WDT in defconfig to make it work by default.

This basically mirrors commit 5e73ad3ffceb ("MIPS: Loongson1: Add
watchdog support for Loongson1 board") except that the driver is built
as a module, since some LOONGSON64 platforms are not LS7A-based.

The defconfig file is also refreshed.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/configs/loongson3_defconfig | 54 ++++++-----------------------------
 1 file changed, 9 insertions(+), 45 deletions(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 12cb1a6a1360..00c591f21938 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -66,7 +66,6 @@ CONFIG_NF_CONNTRACK_SNMP=m
 CONFIG_NF_TABLES=m
 CONFIG_NFT_CT=m
 CONFIG_NFT_NAT=m
-CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
 CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
 CONFIG_NETFILTER_XT_TARGET_MARK=m
 CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
@@ -91,33 +90,11 @@ CONFIG_NF_TABLES_ARP=y
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
-CONFIG_IP_NF_MATCH_RPFILTER=m
 CONFIG_IP_NF_MATCH_TTL=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_ECN=m
-CONFIG_IP_NF_TARGET_TTL=m
-CONFIG_IP_NF_RAW=m
-CONFIG_IP_NF_SECURITY=m
-CONFIG_IP_NF_ARPFILTER=m
-CONFIG_IP_NF_ARP_MANGLE=m
 CONFIG_NF_TABLES_IPV6=y
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_MATCH_RPFILTER=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_RAW=m
-CONFIG_IP6_NF_SECURITY=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_NF_TABLES_BRIDGE=m
 CONFIG_BRIDGE_NF_EBTABLES=m
-CONFIG_BRIDGE_EBT_T_FILTER=m
-CONFIG_BRIDGE_EBT_T_NAT=m
 CONFIG_IP_SCTP=m
 CONFIG_L2TP=m
 CONFIG_BRIDGE=m
@@ -189,7 +166,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CHELSIO is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_CISCO is not set
 # CONFIG_NET_VENDOR_DEC is not set
 # CONFIG_NET_VENDOR_DLINK is not set
@@ -250,9 +226,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=16
 CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_VIRTIO_CONSOLE=y
@@ -263,11 +239,14 @@ CONFIG_GPIO_LOONGSON=y
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM93=m
 CONFIG_SENSORS_W83627HF=m
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_LOONGSON1_WDT=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_DRM=y
-CONFIG_DRM_RADEON=m
 CONFIG_DRM_AMDGPU=m
 CONFIG_DRM_AMDGPU_SI=y
 CONFIG_DRM_AMDGPU_CIK=y
@@ -276,6 +255,7 @@ CONFIG_DRM_AMD_ACP=y
 CONFIG_DRM_AMD_DC_SI=y
 CONFIG_DRM_AST=m
 CONFIG_DRM_QXL=y
+CONFIG_DRM_RADEON=m
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_FB=y
 CONFIG_FB_RADEON=y
@@ -288,27 +268,12 @@ CONFIG_SND=m
 CONFIG_SND_SEQUENCER=m
 CONFIG_SND_SEQ_DUMMY=m
 # CONFIG_SND_ISA is not set
-CONFIG_SND_HDA_INTEL=m
 CONFIG_SND_HDA_PATCH_LOADER=y
-CONFIG_SND_HDA_CODEC_REALTEK=m
-CONFIG_SND_HDA_CODEC_REALTEK_LIB=m
-CONFIG_SND_HDA_CODEC_ALC260=m
-CONFIG_SND_HDA_CODEC_ALC262=m
-CONFIG_SND_HDA_CODEC_ALC268=m
-CONFIG_SND_HDA_CODEC_ALC269=m
-CONFIG_SND_HDA_CODEC_ALC662=m
-CONFIG_SND_HDA_CODEC_ALC680=m
-CONFIG_SND_HDA_CODEC_ALC861=m
-CONFIG_SND_HDA_CODEC_ALC861VD=m
-CONFIG_SND_HDA_CODEC_ALC880=m
-CONFIG_SND_HDA_CODEC_ALC882=m
+CONFIG_SND_HDA_INTEL=m
 CONFIG_SND_HDA_CODEC_SIGMATEL=m
-CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_HDA_CODEC_HDMI_GENERIC=m
-CONFIG_SND_HDA_CODEC_HDMI_INTEL=m
-CONFIG_SND_HDA_CODEC_HDMI_ATI=m
-CONFIG_SND_HDA_CODEC_HDMI_NVIDIA=m
 CONFIG_SND_HDA_CODEC_CONEXANT=m
+CONFIG_SND_HDA_CODEC_REALTEK=m
+CONFIG_SND_HDA_CODEC_HDMI=m
 # CONFIG_SND_USB is not set
 CONFIG_HIDRAW=y
 CONFIG_HID_A4TECH=m
@@ -406,7 +371,6 @@ CONFIG_PRINTK_TIME=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 CONFIG_FUNCTION_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
 CONFIG_CMDLINE_BOOL=y

-- 
2.55.0
