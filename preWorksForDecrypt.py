# -*- coding: utf-8 -*-
import time
import os
import sys
from service.dec import Decrypt
from window.window_main import window_main
from window.window_progress import window_progress
from subprocess import DEVNULL, STDOUT, check_call
from PyQt5.QtWidgets import QApplication

class pre_works_for_decrypt(object):
    def __init__(self, path, folder=False):
        app = QApplication([sys.argv[0]])
        self.window_progress = window_progress()
        if folder:
            self.folder = self.window_progress.select_dir_path()
            if self.folder == "":
                sys.exit()
            self.path = self.find_acb_files([self.folder])
        else:
            self.folder = None
            if len(path) == 0:
                self.path = self.window_progress.select_file_path()
            else:
                self.path = path
        if len(self.path) == 0:
            print("処理対象のファイルが見つかりません。")
            sys.exit()
        self.key_default = "CF222F1FE0748978"
        self.custumFolder = folder
        self.keys = []
        self.note = None
        self.key = None
        if not self.isEncrypted():
            self.key = self.key_default
            sys.exit()
        self.window_progress.show()
        self.decrypt = Decrypt(app, self.window_progress, self.path, self.folder)
        sys.exit()
        # sys.exit(app.exec_())

    def isEncrypted(self):
        offset = None
        data = self.open_hca()
        for no, bt in enumerate(data):
            if bt == 99 or bt == 227:
                if self.byte_chk(bt, no, data):
                    offset = no
                    break
        if offset is None:
            return True
        if data[offset + 5] == 1 or data[offset + 5] == 0:
            return False
        else:
            return True

    def open_hca(self):
        thisFileDir = self.get_path()
        afs2Dir = thisFileDir + '\\acbToHca'
        afs2ExeCutHeadPath = afs2Dir + '\\先頭をカットして展開.bat'
        self.command([afs2ExeCutHeadPath, self.path[0]])
        folderName = os.path.splitext(os.path.basename(self.path[0]))[0]
        hcasDir = afs2Dir + '\\' + folderName
        try:
            file = os.listdir(hcasDir)
        except:
            return []
        filePath = os.path.join(hcasDir, file[0])
        if not os.path.isfile(filePath):
            return []
        with open(filePath, 'rb') as f:
            f.seek(20)
            data = f.read(60)
        data = bytearray(data)
        self.command(['rd', '/s', '/q', hcasDir])
        return data

    def byte_chk(self, ty, index, data):
        if ty == 99:
            chk = [105, 112, 104]
        elif ty == 227:
            chk = [233, 240, 232]
        for ch in chk:
            index = index + 1
            try:
                if data[index] != ch:
                    return False
            except:
                return False
        return True

    def get_path(self):
        if getattr(sys, 'frozen', False):
            # frozen
            return os.path.dirname(sys.executable)
        else:
            # unfrozen
            return os.path.dirname(os.path.realpath(__file__))

    def find_acb_files(self, directories):
        ret = []
        for directory in directories:
            for root, dirs, files in os.walk(directory):
                for file in files:
                    if os.path.splitext(file)[1] in [".acb", ".awb"] or file.lower().endswith("acb.txt") or file.lower().endswith("awb.txt"):
                        ret.append(os.path.join(root, file))
                ret.extend(self.find_acb_files(dirs))
        return ret

    def command(self, attr):
        try:
            check_call(attr, shell=True, stdout=DEVNULL, stderr=STDOUT)
            return True
        except:
            return False

    def finish_decrypt(self):
        sys.exit()
