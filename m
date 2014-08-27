Received: from mail-ie0-f176.google.com ([209.85.223.176]:41341 "EHLO
        mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27006940AbaH0Fykpnyc0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 27 Aug 2014 07:54:40 +0200
Received: by mail-ie0-f176.google.com with SMTP id tr6so12879954ieb.21
        for <linux-mips@linux-mips.org>; Tue, 26 Aug 2014 22:54:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1408915485-8078-4-git-send-email-hauke@hauke-m.de>
References: <1408915485-8078-1-git-send-email-hauke@hauke-m.de>
        <1408915485-8078-4-git-send-email-hauke@hauke-m.de>
Date: Wed, 27 Aug 2014 07:54:34 +0200
Message-ID: <CACna6rwJBDpg9VS4h5hfP4wtGRVwAdRUq5mELeA0OFWWzH9jsA@mail.gmail.com>
Subject: Re: [RFC 2/7] bcm47xx-nvram: add new broadcom nvram driver with dt support
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <zajec5@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, devicetree@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20140827055434.olZy9R0HTR5LLZ-wbeW3u0p6hNh_3vwefPQhVsaHg7c@z>

On 24 August 2014 23:24, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> +On NorthStar ARM SoCs the NAND flash is available at 0x1c000000 and the
> +NOR flash is at 0x1e000000
> +
> +Example:
> +
> +nvram0: nvram@0 {
> +       compatible = "brcm,bcm47xx-nvram";
> +       reg = <0x1c000000 0x01000000>;
> +};

Could we avoid that? Type of flash can easily be checked in the code.
All we need to do is to read BCMA_IOST register of BCMA_CORE_NS_ROM
core.
