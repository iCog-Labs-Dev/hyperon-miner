"""Test-only guard proving basic consumers do not import optional packages."""
import importlib.abc
import sys

class BlockOptional(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        if fullname.split('.')[0] in {'scipy', 'numpy'}:
            raise ImportError('Optional scoring package blocked by consumer test')
        return None

sys.meta_path.insert(0, BlockOptional())

def loaded():
    return any(name in sys.modules for name in ('scipy', 'numpy'))
