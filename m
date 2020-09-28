Return-Path: <SRS0=5whx=DF=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E81BC4727E
	for <linux-mips@archiver.kernel.org>; Mon, 28 Sep 2020 18:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6608C2075A
	for <linux-mips@archiver.kernel.org>; Mon, 28 Sep 2020 18:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601317267;
	bh=vcql8pq/kIjTJtFW2oY6Iy5SNhhAVeanvs3e8YnynJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bIG6OQbH7YmJn69hEFd/FntI8ogf6zAo49mA7DOPTSXSO6bthLW6UWO6jAz0mlCzU
	 p6rNcvCmOWnLgHvSHqtn30R4/ebju55QnlxkbUWqdfBVUbW9FTGSK/3uvClIdRKl/a
	 gU9ECvRLtoglpczHvjpTGzC/m91T8QoPbVEysi+c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1SVE (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Mon, 28 Sep 2020 14:21:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36654 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgI1SVE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Sep 2020 14:21:04 -0400
Received: by mail-ot1-f66.google.com with SMTP id 60so1898239otw.3;
        Mon, 28 Sep 2020 11:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vKooDXQXUIpYRDAbDVaTwr6L0+fDtdWOYDGwyaosHpA=;
        b=Qc0IeOYZiXKGprcHwqMYT9I85Bf952udfqhxoJ6vQnbtNZh4B55htXeralNN8P+8e8
         kiaEspmg5ZgGZQ/lVvolmoSwO3xPID2t9+i/6951r7H9sW9SPEUXW668EoYAR+zEPb1D
         bLCDbIcpSAb2rEqX7Bj+5SNim9PD8PKWl6I74EQ4h/DPDmVNS3ZUr3EQljlzH5Z+CsJr
         B5ODcRJ/hBDjrHaOQt7LFJZDNIrNoIMl5EeE0KyTkkMc5AsJNg3L/+GalmA9oXW1NUBf
         OvQscw5b9bbddsd5Hxfq5f9xGF0f3xhYLhZ34yT3YXfvCMF/O8NVjXb3ttgB/rWhhgTU
         oJPg==
X-Gm-Message-State: AOAM532ZeQJ33sgvPAnuJe0LoIJb9L0KKqPD34+7dcxTkxf4kZd2BsaW
        JI4UPn/I/PxBBGM43s3IDQ==
X-Google-Smtp-Source: ABdhPJyHc2IWWZSeBt74rVXKmOdChJyeIbrFaW/mlVDJ4zZHLz307OBl92fSD+O3D5qGKEltxcEyBw==
X-Received: by 2002:a05:6830:22e6:: with SMTP id t6mr195945otc.88.1601317263360;
        Mon, 28 Sep 2020 11:21:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g21sm2414166oos.36.2020.09.28.11.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 11:21:02 -0700 (PDT)
Received: (nullmailer pid 3026606 invoked by uid 1000);
        Mon, 28 Sep 2020 18:21:01 -0000
Date:   Mon, 28 Sep 2020 13:21:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc:     cheol.yong.kim@intel.com, qi-ming.wu@intel.com, tglx@linutronix.de,
        vigneshr@ti.com, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        brendanhiggins@google.com, boris.brezillon@collabora.com,
        arnd@arndb.de, linux-mtd@lists.infradead.org,
        robert.jarzmik@free.fr, hauke.mehrtens@intel.com,
        christophe.kerello@st.com, miquel.raynal@bootlin.com,
        andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org,
        piotrs@cadence.com, richard@nod.at, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200928182101.GA3025620@bogus>
References: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 24 Sep 2020 16:42:31 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

