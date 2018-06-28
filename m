Received: from mail-by2nam03on0101.outbound.protection.outlook.com ([104.47.42.101]:35297
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23992408AbeF1KxcqukH1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 28 Jun 2018 12:53:32 +0200
From: <catalin.vasile@keysight.com>
Subject: Mark kernel page as read-only
Date: Thu, 28 Jun 2018 10:53:22 +0000
Message-ID: <BN7PR17MB22440CB0C1698E7641812FBFF54F0@BN7PR17MB2244.namprd17.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <catalin.vasile@keysight.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Message-ID: <20180628105322.zLc1-fMUvpzz6NMidXiY2kH649C1SMzwEPzp1q_UiPk@z>

Hi,

I have some pages allocated through __get_free_pages(). Is there a way to set such a page's protection to be read-only? I am working with an octeon2 mips platform.

Best regards,
Catalin Vasile
